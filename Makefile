NAME = libft.a
CFLAGS = -Wall -Werror -Wextra
FILES = $(shell find . -type f -name "*.c" | wc -l)
FILESBONUS = $(shell find . -type f -name "*bonus.c" | wc -l | sed 's/^[[:space:]]*//;s/[[:space:]]*$$//')
FILESMAND = $(shell echo $$(($(FILES) - $(FILESBONUS))))
CALC = $(shell echo $$((($(COUNT) * 100) / $(FILESMAND))))
CALCB = $(shell echo $$((($(COUNT) * 100) / $(FILESBONUS))))
RESETLINE = \r\033[K
BLUE = \033[0;33m
YELLOW = \033[1;34m
RED = \033[0;31m
DEF_COLOR = \033[0m
COUNT = 1
SRC = ft_atoi.c \
		ft_bzero.c \
		ft_calloc.c \
		ft_isalnum.c \
		ft_isalpha.c \
		ft_isascii.c \
		ft_isdigit.c \
		ft_isprint.c \
		ft_itoa.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_memcpy.c \
		ft_memmove.c \
		ft_memset.c \
		ft_putchar_fd.c \
		ft_putendl_fd.c \
		ft_putnbr_fd.c \
		ft_putstr_fd.c \
		ft_split.c \
		ft_strchr.c \
		ft_strdup.c \
		ft_striteri.c \
		ft_strjoin.c \
		ft_strlcat.c \
		ft_strlcpy.c \
		ft_strlen.c \
		ft_strmapi.c \
		ft_strncmp.c \
		ft_strnstr.c \
		ft_strrchr.c \
		ft_strtrim.c \
		ft_substr.c \
		ft_tolower.c \
		ft_toupper.c
SRCBONUS = ft_lstadd_back_bonus.c \
		ft_lstadd_front_bonus.c \
		ft_lstclear_bonus.c \
		ft_lstdelone_bonus.c \
		ft_lstiter_bonus.c \
		ft_lstlast_bonus.c \
		ft_lstmap_bonus.c \
		ft_lstnew_bonus.c \
		ft_lstsize_bonus.c
OBJ = $(SRC:.c=.o)

OBJBONUS = $(SRCBONUS:.c=.o)

$(NAME):	msg_mand $(OBJ)
			@ar rc $(NAME) *.o

bonus:		msg_bonus $(OBJ) reset $(OBJBONUS)
			@ar rc $(NAME) *.o


all:		$(NAME)

$(OBJ): %.o:%.c
			@cc -c $< -o $@ $(CFLAGS)
			@echo "$(RESETLINE)$(BLUE)$@ $(COUNT)/$(FILESMAND) $(CALC)/100%$(DEF_COLOR)\c"
			@if [ $(COUNT) -eq $(FILESMAND) ]; then echo ""; fi
			$(eval COUNT := $(shell echo $$(($(COUNT) + 1))))

$(OBJBONUS): %.o:%.c
			@cc -c $< -o $@ $(CFLAGS)
			@echo "$(RESETLINE)$(BLUE)$@ $(COUNT)/$(FILESBONUS) $(CALCB)/100%$(DEF_COLOR)\c"
			@if [ $(COUNT) -eq $(FILESBONUS) ]; then echo ""; fi
			$(eval COUNT := $(shell echo $$(($(COUNT) + 1))))

clean:
			@echo "$(RED)Cleaning object files...$(DEF_COLOR)"
			@rm -f *.o

fclean:		clean
			@echo "$(RED)Cleaning executable files...$(DEF_COLOR)"
			@rm -f $(NAME)

re: fclean all

reset:
			$(eval COUNT := 1)

msg_mand:
			@echo "$(YELLOW)Compiling Libft Mandotory$(DEF_COLOR)"

msg_bonus:
			@echo "$(YELLOW)Compiling Libft Bonus$(DEF_COLOR)"

.PHONY: all clean fclean re bonus