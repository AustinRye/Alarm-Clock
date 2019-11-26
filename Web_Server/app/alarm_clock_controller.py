import socket
import threading


class AlarmClockController:

    def __init__(self, host='192.168.1.132', port=7):
        self.currentTime = 0
        self.reset = 0
        self.changeTime = 0
        self.changeAlarm = 0
        self.minutesInc = 0
        self.minutesDec = 0
        self.hoursInc = 0
        self.hoursDec = 0
        self.alarmEnable = 0
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
            payload = self.reset*1 + self.changeTime*2 + self.changeAlarm * \
                4 + self.minutesInc*8 + self.minutesDec*16 + self.hoursInc * \
                32 + self.hoursDec*64 + self.alarmEnable*128
            self.transmitPacket(payload)

    def transmitPacket(self, payload=0b000000, buffer_size=32):
        self.sock.send(str(payload).encode())
        time_stamp = int(self.sock.recv(buffer_size).decode('UTF-8'))
        # self.updateTime(time_stamp)
        return time_stamp

    def updateTime(self, fraction_seconds):
        # fraction_seconds_1st_digit = (
        #     fraction_seconds // 10) - 10 * (fraction_seconds // 100)
        # fraction_seconds_2nd_digit = fraction_seconds % 10

        # seconds = fraction_seconds // 100
        # seconds_1st_digit = (seconds // 10) - 6 * (seconds // 60)
        # seconds_2nd_digit = seconds % 10

        # minutes = seconds // 60
        # minutes_1st_digit = (minutes // 10) - 6 * (minutes // 60)
        # minutes_2nd_digit = minutes % 10

        # hours = minutes // 60
        # if hours == 0:
        #     hours_1st_digit = 1
        #     hours_2nd_digit = 2
        # elif hours <= 12:
        #     hours_1st_digit = hours // 10
        #     hours_2nd_digit = hours % 10
        # else:
        #     hours_1st_digit = (hours - 12) // 10
        #     hours_2nd_digit = (hours - 12) % 10

        # return ("%i%i:%i%i:%i%i:%i%i" % (hours_1st_digit, hours_2nd_digit, minutes_1st_digit, minutes_2nd_digit,
        #                                seconds_1st_digit, seconds_2nd_digit, fraction_seconds_1st_digit, fraction_seconds_2nd_digit))
        print("##### Print Time #####")
