Kernel.prepend(Module.new do
  def require(*args)
    pp caller if args.first.include?('abbrev',
    'base64',
    'bigdecimal',
    'csv',
    'drb',
    'getoptlong',
    'mutex_m',
    'nkf',
    'observer',
    'resolv-replace',
    'rinda',
    'syslog')
    super
  end
end)


require_relative '../config/environment''
