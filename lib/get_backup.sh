dir="//var/www/ksiaki-backups"
server="ksiaki-production"
scp $server:$dir/$(ssh $server:$dir/ 'ls -t $dir | head -1') .
