# eodate - Eorzea date command
## Description
Translate Earth time to Eorzea (a world of Final Fantasy XIV) time.
Support for English and Japanese format.

## How to use
Using with no option, translate current time to Eorzea time.
You can use the same options of `date` command.
But you must not specify the format.

First example:
```bash
eodate --date="tommorow"
```
then
```
Iceday, 29th Sun of the 2nd Astral Moon 16:59
```

Second example:
```bash
eodate --date="August 27, 2013 00:00"
```
then
```
Darksday, 16th Sun of the 1st Umbral Moon 03:25
```

Third example:
```bash
LANG=ja_JP.UTF-8 eodate --date="2015/6/23 17:00"
```
then
```
霊5月 14日 水属日 17:08
```
