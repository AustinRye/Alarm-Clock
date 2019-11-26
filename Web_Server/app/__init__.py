from flask import Flask
from app.alarm_clock_controller import AlarmClockController


app = Flask(__name__, instance_relative_config=True)
app.config.from_pyfile('config.py')

alarmClock = AlarmClockController(app.config['ALARM_CLOCK_HOST'], app.config['ALARM_CLOCK_PORT'])
alarmClock.startTransmit()


from app import routes
