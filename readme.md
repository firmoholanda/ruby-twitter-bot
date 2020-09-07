# 📃 ruby-twitter-bot

this is a capstone project from microverse.

this bot was built in ruby, using twitter's API. it was created to store the location of any given tweet in order to analyze which countries most spoke about particular topics.

with this bot one can: 
- search for topics;
- display results while searching;
- auto like found tweets;
- create new tweet informing the bot found it;
- save to local storage using yml;
- retrieve from local storage;
- display the top 10 locations from found tweets.



## 📡 technologies used

- ruby
- twitter api
- yml
- github

ruby, twitter api, yml and github was used on this project.



## 🚀 the project

this project can be found in https://github.com/firmoholanda/ruby-twitter-bot



## 🔨 instructions

the instructions are as follows to download and run this bot:

download:

1. clone the source repository from Github.

  on the command line, enter:
  git clone https://github.com/firmoholanda/ruby-twitter-bot.git 

  or you can use Github for Windows or Github for Mac instead of the command line. go to: https://github.com/firmoholanda/ruby-twitter-bot, and click on the "Clone or download" green button.

2. extract files to the desired location;

3. cd (change directory) to extracted directory;

4. give execute permission to the twitter_bot.rb
``` 
chmod +x bin/twitter_bot.rb
```


installation:

1. create a twitter api account;

  to start using the Twitter api, you need to [register your application with Twitter](https://apps.twitter.com/). registration requires you to answer some questions about your application and agree to the [Twitter api terms of use](https://dev.twitter.com/overview/terms/agreement-and-policy).
  your new application will be assigned a consumer key/secret pair that identifies your application to Twitter.

2. insert your api keys and secret;

change lines 23, 24, 25 and 26 on the bin/twitter_bot.rb file, with your information:
  ```
  @@api_config = {
      consumer_key:        "YOUR_CONSUMER_KEY",
      consumer_secret:     "YOUR_CONSUMER_SECRET",
      access_token:        "YOUR_ACCESS_TOKEN",
      access_token_secret: "YOUR_ACCESS_TOKEN_SECRET"
  }
  ```

3. install dependencies;

```
gem install twitter
```


usage:

- after that, you can start the bot by running 

``` 
ruby ./bin/examples.rb
```

it will initialize the application, look for tweets related to ruby coding, display information on the terminal, like the found tweet and create a new tweet informing what was found. then, it will display the top 10 locations sorted in ascending order and then save that information on a yml file called: stored_tweets.yml

like_the_tweet, alert_in_new_tweet

```
my_bot = TwitterBot.new
my_bot.find_tweets([["ruby", "rayls", "coding"], true, true, true)
my_bot.display_top_10_locations	
my_bot.save_stored_tweets	
```

you can also use:
```
my_bot.retrieve_stored_tweets	
my_bot.display_stored_tweets
```
to load information from stored_tweets.yml to the class and then display on the terminal.


### ✨ [code picture]

<img alt="project image" src="https://github.com/firmoholanda/ruby-twitter-bot/blob/features/img/screen.png"/>



## 🤝 contributing

contributions, issues, and feature requests are welcome!<br/>feel free to check [issues page](https://github.com/firmoholanda/ruby-enumerable-methods/development/issues).

1. fork it (https://github.com/firmoholanda/ruby-twitter-bot/development/fork)
2. create your working branch (git checkout -b [choose-a-name])
3. commit your changes (git commit -am 'what this commit will fix/add/improve')
4. push to the branch (git push origin [chosen-name])
5. create a new pull request



## 🤖 contributor

firmo holanda - [GitHub](https://github.com/firmoholanda)



## 🙋‍♂ show your support

give a ⭐️ if you like this project!



## 📝 license

this project is [MIT](https://github.com/firmoholanda/newsweek.com-clone/development/blob/development/license.txt) licensed.
