#### OPTIONAL SETTINGS ####
START_DATE = Time.now - (60*60*24) * 366  # defaults to 366 days ago
END_DATE = Time.now                       # defaults to now
COMMITS_PER_DAY = 1                       # number of commits to be made per day


DAY_IN_SECONDS = (60*60*24)
date = START_DATE
while END_DATE - date >= 0

  COMMITS_PER_DAY.times do
    # make a change to file.rb
    File.open('file.rb', 'a') do |f|
      f.puts 'Green slate'
    end

    # add the file for commit
    `git add .`

    # commit the file
    `git commit -m"Minor changes."`

    # amend the commit date
    formatted_date = date.strftime("Thu %b %e %H:%M:%S GMT %Y");
    
    # show our progress
    print '.'
    
    # define our env for Windows otherwise an error would occur
    ENV['GIT_COMMITTER_DATE']="#{formatted_date}"
    
    # run the command
    `git commit --amend --date "#{formatted_date}" -m"Minor changes.""`

  end

  date += DAY_IN_SECONDS
end
