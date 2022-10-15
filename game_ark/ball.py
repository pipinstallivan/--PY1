import pygame

class Ball():

    def __init__(self, screen):
        # initalization of ball
        self.screen = screen
        self.screen_rect = screen.get_rect()
        self.xPos = self.screen_rect.centerx
        self.yPos = self.screen_rect.centery
        self.pos = (self.xPos, self.yPos)
        self.xSpeed = 1.0
        self.ySpeed = 0.0
    def draw(self):
        # drawing ball on screen
        
        pygame.draw.circle(self.screen, (250, 0, 250), (self.pos), 20)
    def update_unit(self):
        # обновление позиции бампера
        a = 1
        