<?php
namespace Deployer;

require 'recipe/common.php';

// Project name
set('application', 'ksiaki');

// Project repository
set('repository', 'git@bitbucket.org:rgodawa/ksiaki.git');

// [Optional] Allocate tty for git clone. Default value is false.
set('git_tty', true);

// Shared files/dirs between deploys
set('shared_files', []);
set('shared_dirs', ['log', 'config']);

// Writable dirs by web server
set('writable_dirs', []);


// Hosts

host('ksiaki')
    ->stage('staging')
    ->forwardAgent(true)
    ->set('deploy_path', '/var/www/{{application}}')
    ->set('db_user', 'ksiaki_production')
    ->set('db_name', 'ksiaki');

host('ksiaki-production')
    ->stage('production')
    ->forwardAgent(true)
    ->set('deploy_path', '/var/www/{{application}}')
    ->set('db_user', 'ksiaki_production')
    ->set('db_name', 'ksiaki');


// Tasks

desc('Deploy your project');
task('deploy', [
    'deploy:backup',
    'deploy:info',
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'deploy:update_code',
    'deploy:shared',
    'deploy:writable',
    'deploy:vendors',
    'deploy:clear_paths',
    'deploy:symlink',
    'deploy:run_migrations',
    'deploy:update_procedures',
    'deploy:unlock',
    'deploy:nginx_restart',
    'deploy:phpfpm_restart',
    'inform:rollbar',
    'cleanup',
    'success'
]);

task('deploy:nginx_restart', function () {
    run('service nginx restart');
});

task('deploy:phpfpm_restart', function () {
    run('service php7.0-fpm restart');
});

task('deploy:run_migrations', function () {
    cd('{{release_path}}');
    run('APPLICATION_ENV={{stage}} php db/migrate.php');
});

task('deploy:update_procedures', function () {
    cd('{{release_path}}');
    run('APPLICATION_ENV={{stage}} php db/update_procedures.php');
});

task('deploy:backup', function () {
    run('php /var/www/full-backup-ksiaki.php');
});

task('inform:rollbar', function () {
    cd('{{release_path}}');
    run('APPLICATION_ENV={{stage}} php rollbar_deploy.php');
});

// [Optional] If deploy fails automatically unlock.
after('deploy:failed', 'deploy:unlock');

set('allow_anonymous_stats', true);
