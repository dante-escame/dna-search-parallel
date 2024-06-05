FLAGS=-O3

CC=gcc

RM=rm -f

EXEC=dna
EXEC_PARALLEL=dna_parallel

all: $(EXEC) $(EXEC_PARALLEL)

$(EXEC):
	$(CC) $(FLAGS) dna.c -c -o dna.o
	$(CC) $(FLAGS) dna.o -o $(EXEC)

$(EXEC_PARALLEL):
	$(CC) $(FLAGS) dna_parallel.c -c -fopenmp -o dna_parallel.o
	$(CC) $(FLAGS) dna_parallel.o -o $(EXEC_PARALLEL) -fopenmp

run:
	./$(EXEC)

run_parallel:
	./$(EXEC_PARALLEL)

clean:
	$(RM) dna.o $(EXEC) dna_parallel.o $(EXEC_PARALLEL)