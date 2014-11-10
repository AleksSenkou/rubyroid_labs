time_updater
============

### Condition
Create a gem that will monkeypatch'it Time object in Ruby and add functionality http://www.ruby-doc.org/core-2.1.4/Time.html#method-i-strftime

### Examples

<p>DateTime.now.ymd => strftime("%y %m %d")</p>
<p>DateTime.now.Bd => strftime("%B %d")</p>
<p>DateTime.now.M3N => strftime("%M %3N")</p>