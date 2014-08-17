namespace :docker do
  desc 'Cleanup old containers'
  task :cleanup do
    `docker rm -f db_tuxedo rails_tuxedo`
    puts 'Fresh and clean... :)'
  end

  desc 'Deploy application'
  task :deploy => ["db:data", "db:start", "rails:server"] do
    puts 'Application deployed to Docker containers... :)'
  end

  namespace :rails do
    desc 'Build app'
    task :build do
      system 'docker build -t tuxedo .'
      puts 'App image built... :)'
    end

    desc 'Start rails_tuxedo Docker container'
    task :server do
      `docker run --name rails_tuxedo --link db_tuxedo:db_tuxedo -p 80:3000 -d tuxedo`
      puts 'rails_tuxedo deployed...'
    end

    desc 'Get Docker container environment variables'
    task :env do
      `docker run --name rails_tuxedo --rm --link db_tuxedo:db_tuxedo -p 80:3000 tuxedo env`
    end
  end

  namespace :db do
    desc 'Start persistent data container'
    task :data do
      `docker run -v /var/lib/postgresql/data --name dbdata_tuxedo -d postgres echo Data-only container for Postgres`
      puts 'Data container deployed...'
    end

    desc 'Start Postgres Docker container'
    task :start do
      `docker run --volumes-from dbdata_tuxedo --name db_tuxedo -d postgres`
      puts 'Postgres deployed...'
    end

    desc 'Create database'
    task :create do
      `docker run --link db_tuxedo:db_tuxedo tuxedo sh -c "bundle exec rake db:create"`
      puts 'Database created... :)'
    end

    desc 'Run database migrations'
    task :migrate do
      system 'docker run --link db_tuxedo:db_tuxedo tuxedo sh -c "bundle exec rake db:migrate"'
    end

    desc 'Populate database with dummy data'
    task :populate do
      system 'docker run --link db_tuxedo:db_tuxedo tuxedo sh -c "bundle exec rake db:populate"'
      puts 'Database hath been populated... :)'
    end

    desc 'Remove database container'
    task :remove do
      `docker rm -f dbdata_tuxedo`
      puts 'Database removed...'
    end
  end
end
