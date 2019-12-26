# 📃 ruby-twitter-bot

this is a capstone project from microverse.

on this project i build a bot in ruby, using twitter's api. it was created with the intent of storing the location originated from the found tweet so i could quantize what part of the globe was more active on the search topic.
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

1. create a twitter api account:
to start using the Twitter api, you need to [register your application with Twitter](https://apps.twitter.com/). registration requires you to answer some questions about your application and agree to the [Twitter api terms of use](https://dev.twitter.com/overview/terms/agreement-and-policy).
your new application will be assigned a consumer key/secret pair that identifies your application to Twitter.

2. 
change lines 23, 24, 25 and 26 on the twitter_bot.rb file, with your information:
  ```
  @@api_config = {
      consumer_key:        "YOUR_CONSUMER_KEY",
      consumer_secret:     "YOUR_CONSUMER_SECRET",
      access_token:        "YOUR_ACCESS_TOKEN",
      access_token_secret: "YOUR_ACCESS_TOKEN_SECRET"
  }
  ```

usage:

- after that, you can start the bot by running 
``` 
ruby ./bin/twitter_bot.rb
```



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
