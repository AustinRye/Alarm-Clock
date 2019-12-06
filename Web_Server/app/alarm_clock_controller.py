import socket
import threading


class AlarmClockController:

    def __init__(self, host, port):
        self.time = []
        self.alarmTime = []
        self.reset = 0
        self.changeAlarm = 0
        self.changeEnable = 0
        self.alarmEnable = 0
        self.alarmEnabled = 0
        self.alarmOn = 0
        self.seconds1stDigitInc = 0
        self.seconds1stDigitDec = 0
        self.seconds2ndDigitInc = 0
        self.seconds2ndDigitDec = 0
        self.minutes1stDigitInc = 0
        self.minutes1stDigitDec = 0
        self.minutes2ndDigitInc = 0
        self.minutes2ndDigitDec = 0
        self.hours1stDigitInc = 0
        self.hours1stDigitDec = 0
        self.hours2ndDigitInc = 0
        self.hours2ndDigitDec = 0
        self.transmit = False
        self.thread = threading.Thread(target=self.transmitLoop)
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.connect((host, port))

    def startTransmit(self):
        self.transmit = True
        self.thread = threading.Thread(target=self.transmitLoop)
        self.thread.start()

    def stopTransmit(self):
        self.transmit = False
        self.thread.join()

    def transmitLoop(self):
        while(self.transmit):
            payload = self.reset*1 + self.changeAlarm*2 + self.changeEnable*4 + self.alarmEnable*8 + self.seconds1stDigitInc*16 + \
                self.seconds1stDigitDec*32 + self.seconds2ndDigitInc*64 + \
                self.seconds2ndDigitDec*128 + self.minutes1stDigitInc*256 + \
                self.minutes1stDigitDec*512 + self.minutes2ndDigitInc * \
                1024 + self.minutes2ndDigitDec*2048 + self.hours1stDigitInc*4096 + \
                self.hours1stDigitDec*8192 + self.hours2ndDigitInc * \
                16384 + self.hours2ndDigitDec*32768
            self.transmitPacket(payload)

    def transmitPacket(self, payload=0b000000, buffer_size=32):
        self.sock.send(str(payload).encode())
        time_stamp = self.sock.recv(buffer_size).decode('UTF-8').split("-")
        self.time = self.updateTime(int(time_stamp[0]))
        self.alarmTime = self.updateTime(int(time_stamp[1]))

        if int(time_stamp[2]) == 1 or int(time_stamp[2]) == 3:
            self.alarmOn = 1
        else:
            self.alarmOn = 0

        if int(time_stamp[2]) == 2 or int(time_stamp[2]) == 3:
            self.alarmEnabled = 1
        else:
            self.alarmEnabled = 0

    def updateTime(self, fraction_seconds):
        fraction_seconds_1st_digit = (
            fraction_seconds // 10) - 10 * (fraction_seconds // 100)
        fraction_seconds_2nd_digit = fraction_seconds % 10

        seconds = fraction_seconds // 100
        seconds_1st_digit = (seconds // 10) - 6 * (seconds // 60)
        seconds_2nd_digit = seconds % 10

        minutes = seconds // 60
        minutes_1st_digit = (minutes // 10) - 6 * (minutes // 60)
        minutes_2nd_digit = minutes % 10

        hours = minutes // 60
        if hours == 0:
            hours_1st_digit = 1
            hours_2nd_digit = 2
        elif hours <= 12:
            hours_1st_digit = hours // 10
            hours_2nd_digit = hours % 10
        else:
            hours_1st_digit = (hours - 12) // 10
            hours_2nd_digit = (hours - 12) % 10

        if hours >= 12:
            pm = 1
        else:
            pm = 0

        time = [hours_1st_digit, hours_2nd_digit, minutes_1st_digit,
                minutes_2nd_digit, seconds_1st_digit, seconds_2nd_digit, pm]
        return time
        # return ("%i%i:%i%i:%i%i:%i%i" % (hours_1st_digit, hours_2nd_digit, minutes_1st_digit, minutes_2nd_digit,
        #                                  seconds_1st_digit, seconds_2nd_digit, fraction_seconds_1st_digit, fraction_seconds_2nd_digit))
