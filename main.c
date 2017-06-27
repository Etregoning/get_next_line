#include <fcntl.h>
#include <stdio.h>
#include "get_next_line.h"

int get_next_line(const int fd, char **line);

int   main(int ac, char **av)
{
  int fd;
  char *line;

  if (ac)
  {
    fd = open(av[1], O_RDONLY);
    get_next_line(fd, &line);
  }
}
