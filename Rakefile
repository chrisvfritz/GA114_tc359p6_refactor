# Thanks to Chris Fritz.
# https://github.com/GA114/tc359p2/issues/1
TEMP_PATH = 'tmp'
HEROKU_URL = open("URL").read

task :url do
  system "echo #{HEROKU_URL}"
end

namespace :url do

  task :get do
    system "curl #{HEROKU_URL}"
  end

  task :download, :filename do |tsk, args|
    args.with_defaults(
      filename: 'out.html'
    )

    filepath = "#{TEMP_PATH}/#{args[:filename]}"

    system "mkdir #{TEMP_PATH}"
    system "curl -L #{HEROKU_URL} > #{filepath}"
    system "cat #{filepath}"
  end

end

task :clean do
  system "rm -rf #{TEMP_PATH}"
end
