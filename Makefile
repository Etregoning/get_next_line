# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: etregoni <etregoni@student.42.us.org>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/03/21 04:37:44 by etregoni          #+#    #+#              #
#    Updated: 2017/03/21 04:37:47 by etregoni         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = get_next_line
LIB = libft.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = /bin/rm -rf

SRC = get_next_line.c main.c

LIBSRC = ft_strnew.c ft_charjoin.c ft_strlen.c ft_strcat.c ft_memset.c \
				ft_memmove.c ft_strclr.c ft_strjoin.c ft_lstnew.c ft_lstadd.c ft_strchr.c

LIBLIST  :=  $(shell ls -1 libft | grep .c$$)
LIBOBJ   :=  $(LIBLIST:.c=.o)
LIBOBJ   :=  $(addprefix libft/, $(LIBOBJ))

.PHONY: all

all: $(NAME)

libft/%.o: libft/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(LIB):
	ar rc $(LIB) $(LIBOBJ)
	ranlib $(LIB)

debug:
	$(CC) $(CFLAGS) $(SRC) libft/ft_strnew.c libft/ft_memset.c -g -o get_next_line

$(NAME): $(LIBOBJ) $(LIB) $(SRC)
	$(CC) $(CFLAGS) -o get_next_line.o -c get_next_line.c
	$(CC) $(CFLAGS) -o main.o -c main.c
	$(CC) $(CFLAGS) $(SRC) -L . -lft -o $(NAME)

clean:
	$(RM) $(SRCOBJ)
	$(RM) $(LIBOBJ)


fclean: clean
	$(RM) $(NAME)
	$(RM) $(LIB)

re: fclean all

re-db: fclean debug
