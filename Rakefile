require 'erb'
require 'fileutils'

task :default => [:gen_exs]

desc 'Generate elixir AoC template'
task :gen_exs, [:year, :day] do |task, args|
  generate_template_exs(args[:day], args[:year])
end


def generate_template_exs(day=1, year=2019)
  template = File.open('templates/elixir.exs.erb', 'r').read
  @day = day
  renderer = ERB.new(template)
  FileUtils.mkdir_p("#{year}/#{day}")
  out = File.new("#{year}/#{day}/#{day}.exs", File::WRONLY|File::CREAT|File::EXCL)
  out.puts(renderer.result())
  out.close
end