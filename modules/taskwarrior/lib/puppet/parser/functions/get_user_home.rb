# get_user_home.rb
#
#
module Puppet::Parser::Functions
  newfunction(:get_user_home, :type => :rvalue, :doc => <<-EOS
Given a user name returns its home directory path
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "get_user_home(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    user = arguments[0]

#    unless string.is_a?(String)
#      raise(Puppet::ParseError, 'str2bool(): Requires either ' +
#        'string to work with')
#    end

    home = %x( echo -n ~#{user} )

    return home
  end
end

# vim: set ts=2 sw=2 et :

