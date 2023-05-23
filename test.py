from whiteboard import solution
from unittest import TestCase, main

class TestWhiteboard(TestCase):

    def test_1_ten_percent(self):
        # Test case 1: 10% discount on $100 item
        self.assertEqual(solution(100, 10), 90)

    def test_2_twenty_percent(self):
        # Test case 2: 20% discount on $50 item
        self.assertEqual(solution(50, 20), 40)

    def test_3_five_percent(self):
        # Test case 3: 5% discount on $200 item
        self.assertEqual(solution(200, 5), 190)

    def test_4_zero_percent(self):
        # Test case 4: 0% discount on $75 item
        self.assertEqual(solution(75, 0), 75)

    def test_5_fifty_percent(self):
        # Test case 5: 50% discount on $30 item
        self.assertEqual(solution(30, 50), 15)

if __name__ == "__main__":
    main()