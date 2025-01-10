#Declarations
NAME = libft.a
HEADERS_DIR := header_files 
LIBFT_DIR := source_files/libft_srcs
PRINTF_DIR := source_files/printf_srcs
GNL_DIR := source_files/gnl_srcs


#Main sourcers
LIBFT_SRCS := $(wildcard $(LIBFT_DIR)/*.c)
PRINTF_SRCS := $(wildcard $(PRINTF_DIR)/*.c)
GNL_SRCS := $(wildcard $(GNL_DIR)/*.c)


#Variables to convert SRCS and BONUS *.c in *.o (object files)
LIBFT_OBJS = $(LIBFT_SRCS:.c=.o)
PRINTF_OBJS = $(PRINTF_SRCS:.c=.o)
GNL_OBJS = $(GNL_SRCS:.c=.o)



#Flags
CC = cc
AR = ar rcs
RM = rm -f
CFLAGS = -Wall -Werror -Wextra
IFLAG = -I $(HEADERS_DIR)

#All files must exist
$(NAME): $(LIBFT_OBJS) $(PRINTF_OBJS) $(GNL_OBJS)
	$(AR) $@ $^

#Every *.c must be compiled in *.o files
%.o: %.c
	$(CC) $(CFLAGS) $(IFLAG) -c $< -o $@

#Main target (Executed if the user execute make)
all: $(NAME)

#Rule that delete all the *.o files
clean:
	$(RM) $(LIBFT_OBJS) $(PRINTF_OBJS) $(GNL_OBJS)

#Rule that delete all the *.o files and also $(NAME)
fclean: clean
	$(RM) $(NAME)

#Rule that compile everything with new files and no cached one
re: fclean all

.PHONY: all clean fclean re

