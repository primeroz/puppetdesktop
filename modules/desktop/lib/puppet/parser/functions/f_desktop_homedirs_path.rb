module Puppet::Parser::Functions
    newfunction(:f_desktop_homedirs_path, :type => :rvalue) do |args|
        homedirs  = args[0]
        homepath  = args[1]

        config = Hash.new

        homedirs.each do |key,value|
          value["path"] ="#{homepath}/#{key}"
          config["#{key}"] = value
        end

        config
    end
end
