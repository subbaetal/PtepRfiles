# opened the file with 'r' (readmode)
with open('hays_small.bed', 'r') as f:
	# will store the scaffold results here
	scaffold_list = []

	# for each line in the file, grab the name, start position, and end position.
	# store these in a list and append to our result list
	for line in f.readlines():
		line_split = line.split('\t')
		name = line_split[0]
		start_pos = line_split[1]
		end_pos = line_split[2]

		# create a list with these values, using int() to CAST from string to integer
		scaffold = [name, int(start_pos), int(end_pos)]
		scaffold_list.append(scaffold)

	# this will be used to return the start position as an integer value
	def return_start_pos(scaffold):
		return int(scaffold[1])

	scaffold_list.sort(key=return_start_pos)
	print('scaffold list sorted')

# opening the genome file to return the sequence from the start/end positions
with open('pt_genome.fna', 'r') as f:
	print('reading genome')
	# getting the genome string out of the file, into something python can read
	genome_string = ''

	# ignore the first line in the file - start from line 1 instead of 0
	lines = f.readlines()[1:]
	print('creating genome string')
	for line in lines:
		# :-1 to ignore the \n
		# ignore lines that start with >
		if not line.startswith('>'):
			genome_string += line[:-1]

# open the file to store results, this time with 'w' (write mode).  this will delete existing 'result.csv' on each run
with open('result_2.csv', 'w') as f:
	print('writing file')
	# write the header (column names)
	f.writelines('name,start_position,end_position,sequence\n')
	for scaffold in scaffold_list:
		start = scaffold[1]
		end = scaffold[2]

		scaffold.append(genome_string[start:end])

		f.writelines(f"{scaffold[0]},{scaffold[1]},{scaffold[2]},{scaffold[3]}\n")
