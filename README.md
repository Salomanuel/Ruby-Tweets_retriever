# TMNT

## TWITTER MEGA NINJA TWEETS (retriever)

### the task

Write a Ruby command line application that asks for a Twitter user name and shows the latest tweets mentioning that user.

### how to use

in the command line write 
`$ ruby lib/twitter_mega.rb`

### notes
Twitter's Search API returns only tweets from the past 7 days. So if you want to retrieve ALL tweets mentioning an arbitrary user, you can't (so far as I know).

### stuff to add

* validations
	* of the user and the results length
	* of the settings
* way more tests
* encrypt settings
* add rescues when the data doesn't work