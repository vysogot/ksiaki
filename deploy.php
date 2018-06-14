<?php
namespace Deployer;

require 'recipe/common.php';

// Project name
set('application', 'konkursiaki');

// Project repository
set('repository', 'git@bitbucket.org:rgodawa/ksiaki.git');

// [Optional] Allocate tty for git clone. Default value is false.
set('git_tty', true);

// Shared files/dirs between deploys
set('shared_files', []);
set('shared_dirs', ['log']);

// Writable dirs by web server
set('writable_dirs', []);


// Hosts

host('ksiaki')
    ->stage('production')
    ->forwardAgent(true)
    ->set('deploy_path', '/var/www/{{application}}');


// Tasks

desc('Deploy your project');
task('deploy', [
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
    'deploy:unlock',
    'deploy:restart',
    'cleanup',
    'success'
]);

task('deploy:restart', function () {
    run('service php7.0-fpm restart');
    run('service nginx restart');
});

task('db:update', function () {
    cd('{{release_path}}');
    run('APPLICATION_ENV={{stage}} php db/reset.php');
});

// [Optional] If deploy fails automatically unlock.
after('deploy:failed', 'deploy:unlock');

set('allow_anonymous_stats', true);
