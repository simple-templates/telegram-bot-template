# Advent Of Code Telegram Bot
Simple bot written in Ruby using the awesome [telegram-bot](https://github.com/telegram-bot-rb/telegram-bot/) gem.<br/>
The idea is to easily view your private leaderboards for the [Advent Of Code](https://adventofcode.com/), and more functionality is planned for the feature.

It uses a yaml config file to read the telegram bot token and other settings, so the keys are not published to github (I hope).

## What does it do?
|Command|Description|Configurable|
|---|---|---|
|`/start`|Summary of what the bot does|:heavy_check_mark:|
|`/greet`|Greets the user that sent the message in a random language|:x:|
|`/set_leaderboard <token>`|Sets the Private leaderboard's token for the current chat and stores it in the database|:x:|
|`/leaderboard`|Shows the ordered list of players (and their scores) for the set leaderboard, or an error message if no token was set|:x:|
|`/time`|Shows the time remaining to the start of the challenge (or the next problem)|:x:|
|`/problem`|Shows today's problem (or an error if no problem is found for today)|:x:|

## But why?
Because I am excited for the challenge and I wanted an easy way to share the results with my friends!

## Fork me!
This project is a good template for anyone trying to build a telegram bot. Feel free to fork it and make it your own!

## Why is it in spanish?
That's the native tonge for my friends and I, so why not?

If you do not speak spanish and wish to use this bot for the Advent of Code, please open an issue.

## Known issues
* <ins>Time-zoning</ins> &rarr; The Advent Of Code takes place in ETC (UTC-5). The Telegram API does not provide a way to know the timezone of the users, so I have decided to just use the local timezone where the bot is running.

## Planned features
- [x] Pull today's problem and display it as a normal message
- [x] Have a countdown to the next challenge
