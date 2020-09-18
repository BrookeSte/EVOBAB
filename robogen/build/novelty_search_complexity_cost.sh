#!/bin/bash
echo "Starting novelty_search complexity cost experiments"
echo "------------------------------------"
for x in {3..10}
do
	echo "Finishing experiment set 1"
	./robogen-server 8001 &>/dev/null &
	./robogen-evolver $RANDOM noveltyResults/complexityCost/Experiment1/novelty_output1 ../projectSimulations/novelty_search/evolConf1.txt --save-all --complexity-cost
done
for i in {2..9} 
do
	echo "Running experiment set $i"
	for x in {1..10}
	do
		echo "Running experiment $i:($x/10)."
		./robogen-server 800$i &>/dev/null &
		./robogen-evolver $RANDOM noveltyResults/complexityCost/Experiment$i/novelty_output$i ../projectSimulations/novelty_search/evolConf$i.txt --save-all --complexity-cost
		echo "Experiment $i:($x/10) finished."
	done
	echo "Experiment set $i finished..."
done
for i in {10..11} 
do
	echo "Running experiment set $i"
	for x in {1..10}
	do
		echo "Running experiment $i:($x/10)."
		./robogen-server 80$i &>/dev/null &
		./robogen-evolver $RANDOM noveltyResults/complexityCost/Experiment$i/novelty_output$i ../projectSimulations/novelty_search/evolConf$i.txt --save-all --complexity-cost
		echo "Experiment $i:($x/10) finished."
	done
	echo "Experiment set $i finished..."
done
echo "Successfully completed all experiments"