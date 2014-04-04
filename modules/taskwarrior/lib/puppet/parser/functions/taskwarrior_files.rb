module Puppet::Parser::Functions
    newfunction(:taskwarrior_files, :type => :rvalue) do |args|
        users    = args[0]
        path   = args[1]
        filename   = args[2]

        config=Hash.new

        users.each do |user|
            inner_config=Hash.new

            inner_config["user"] = user
            inner_config["path"] = path
            inner_config["filename"] = filename

            config["#{user}_#{filename}"] = inner_config
        end

        config
    end
end
