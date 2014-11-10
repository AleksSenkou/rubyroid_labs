time_updater
============

### Условие
Создать гем, который будет monkeypatch'ить объекты Time в руби и добавит  функционал http://www.ruby-doc.org/core-2.1.4/Time.html#method-i-strftime

### Примеры

<p>DateTime.now.ymd => strftime("%y %m %d")</p>
<p>DateTime.now.Bd => strftime("%B %d")</p>
<p>DateTime.now.M3N => strftime("%M %3N")</p>