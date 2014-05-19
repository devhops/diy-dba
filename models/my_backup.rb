# encoding: utf-8

##
# Backup Generated: my_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t my_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:my_backup, 'Description for my_backup') do
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  archive :my_archive do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.add "/path/to/a/file.rb"
    archive.add "/path/to/a/folder/"
    archive.exclude "/path/to/a/excluded_file.rb"
    archive.exclude "/path/to/a/excluded_folder"
  end

  ##
  # MySQL [Database]
  #
  database MySQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = "db_name"
    db.username           = "db_pass"
    db.password           = "password"
    db.host               = "server.name.co.uk"
    db.port               = 3306
    db.socket             = "/tmp/mysql.sock"
    # Note: when using `skip_tables` with the `db.name = :all` option,
    # table names should be prefixed with a database name.
    # e.g. ["db_name.table_to_skip", ...]
    db.skip_tables        = ["skip", "these", "tables"]
    db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ["--create-options", "--single-transaction"]
  end

  ##
  # RSync [Storage]
  #
  # The default `mode` is :ssh, which does not require the use
  # of an rsync daemon on the remote. If you wish to connect
  # directly to an rsync daemon, or via SSH using daemon features,
  # :rsync_daemon and :ssh_daemon modes are also available.
  #
  # If no `host` is specified, the transfer will be a local
  # operation. `mode` and `compress` will have no meaning.
  #
  store_with RSync do |rsync|
    rsync.mode      = :ssh
    rsync.host      = "127.0.0.1"
    rsync.path      = "/sarah-db-diy"
    rsync.compress  = true
  end

  ##
  # Bzip2 [Compressor]
  #
  compress_with Bzip2

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = "sarah@devhops.co.uk"
    mail.to                   = "sarah@devhops.co.uk"
    mail.address              = "localhost"
    mail.port                 = 587
    mail.domain               = "devhops.co.uk"
    mail.user_name            = "sarah@devhops.co.uk"
    mail.password             = "youmustthinkimstupid"
    mail.authentication       = "plain"
    mail.encryption           = :starttls
  end

end
