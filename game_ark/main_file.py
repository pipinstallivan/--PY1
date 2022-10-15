import pygame
import controls_file
from bumper import Gun
from ball import Ball
def run():
    sizes = (640, 480)
    pygame.init()
    screen = pygame.display.set_mode(sizes)
    pygame.display.set_caption("super_ark")
    bg_color = (0, 0, 0)
    ball = Ball(screen)
    bumper = Gun(screen)
    while True:
        controls_file.sniff_events(bumper)
        bumper.update_unit()
        ball.update_unit()
        screen.fill(bg_color)  # рисуем экран черный
        bumper.draw()   # поверх рисуем бампер
        ball.draw()
        pygame.display.flip()  # обновляем изображение в окне

run()
