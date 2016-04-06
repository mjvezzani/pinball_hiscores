Set up ssh key and account.

```
ssh-add ~/.ssh/id_reliacode
heroku help accounts
heroku accounts:set reliacode
```

Clone repo.

```
heroku git:clone -a pinball-high-scores
```

Reproduce error and check logs.

```
open https://pinball-high-scores.herokuapp.com/pins/4
heroku logs --app pinball-high-scores
```

Finish setting up environment.

```
rvm install ruby-2.2.3
gem install bundle
bundle
bundle --binstubs install
```

Create backup of production db and import for local development.

```
heroku pg:backups capture --app pinball-high-scores
curl -o latest.dump `heroku pg:backups public-url --app pinball-high-scores`
```

Create new config/database.yml for postgresql.

```
echo -e "development:\n  adapter: postgresql\n  database: pball_development\n  username: pball_admin\n  password: xxxxxxxxxxxx\n  encoding: utf8\n  pool: 5\n \ntest: \n  adapter: postgresql\n  database: pball_test\n  username: rails\n  password: xxxxxxxxxxxx\n  encoding: utf8\n  pool: 5" > config/database.yml
```

Create development database and setup user.

```
createdb pball_dev2
pg_restore --verbose --clean -h localhost -U davidvezzani -d pball_development db/latest.dump

psql -d postgres -U davidvezzani
create user pball_admin with password 'pass13!#';
GRANT ALL ON DATABASE pball_development TO pball_admin; 
```

Create test database and setup user.

```
PGPASSWORD=xxxxxxxx pg_dump -Fc --no-acl --no-owner -h localhost -U davidvezzani pball_development > db/pball_development.dump
createdb pball_test
pg_restore --verbose --clean -h localhost -U davidvezzani -d pball_test db/pball_development.dump

psql -d postgres -U davidvezzani
CREATE USER rails with SUPERUSER CREATEDB password 'xxxxxxxx';
GRANT ALL ON DATABASE pball_test TO rails; 
```

Disable migration and migrate.

```
mv db/migrate/20160301114000_change_hi_score_score_string_to_big_int.rb db
bin/rake db:migrate db:migrate:status
```

Access Rails console to update record with orphaned foreign key that was causing the error.

```
heroku run console --app pinball-high-scores
```


