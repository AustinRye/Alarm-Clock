import socket
from time import sleep


class fpga_control:

    def __init__(self, host='192.168.1.132', port=7):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.connect((host, port))

    def transmit_packet(self, payload=0b000000, buffer_size=32):
        self.sock.send(str(payload).encode())
        received_packet = int(self.sock.recv(buffer_size).decode('UTF-8'))
        return received_packet

    def print_time(self, fraction_seconds):
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

        print("%i%i:%i%i:%i%i:%i%i" % (hours_1st_digit, hours_2nd_digit, minutes_1st_digit, minutes_2nd_digit,
                                       seconds_1st_digit, seconds_2nd_digit, fraction_seconds_1st_digit, fraction_seconds_2nd_digit))

    def time_request_loop(self):
        while(1):
            time_stamp = self.transmit_packet(0b000000)
            self.print_time(time_stamp)
