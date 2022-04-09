###############################################
##########     Parse SLiM OUTPUT     ##########
###############################################
#### Parser SLiM output to get the simulations results recorded at the different generations.


########################### 
########## 1. Model 1
###########################
grep "6650 T" Model1/Model_1.out | grep "p5" | sed 's/#//g' > Model1/6650.txt
grep "6652 T" Model1/Model_1.out | grep "p6" | sed 's/#//g' > Model1/6652.txt
grep "6654 T" Model1/Model_1.out | grep "p6" | sed 's/#//g' > Model1/6654.txt
gens="6656 6659"
for gen in $gens;do
gen_mod=$gen" T"
grep "$gen_mod" Model1/Model_1.out | grep "p7" | sed 's/#//g' > Model1/${gen}.txt
done

########################### 
########## 2. Model 2
###########################
grep "6650 T" Model2/Model_2.out | grep "p5" | sed 's/#//g' > Model2/6650.txt
grep "6652 T" Model2/Model_2.out | grep "p6" | sed 's/#//g' > Model2/6652.txt
grep "6654 T" Model2/Model_2.out | grep "p6" | sed 's/#//g' > Model2/6654.txt
gens="6656 6659"
for gen in $gens;do
gen_mod=$gen" T"
grep "$gen_mod" Model2/Model_2.out | grep "p7" | sed 's/#//g' > Model2/${gen}.txt
done


########################### 
########## 3. Model 3
###########################
grep "6650 T" Model3/Model_3.out | grep "p5" | sed 's/#//g' > Model3/6650.txt
grep "6652 T" Model3/Model_3.out | grep "p6" | sed 's/#//g' > Model3/6652.txt
grep "6654 T" Model3/Model_3.out | grep "p6" | sed 's/#//g' > Model3/6654.txt
gens="6656 6659"
for gen in $gens;do
gen_mod=$gen" T"
grep "$gen_mod" Model3/Model_3.out | grep "p7" | sed 's/#//g' > Model3/${gen}.txt
done

########################### 
########## 4. Model 4
###########################
grep "6650 T" Model4/Model_4.out | grep "p5" | sed 's/#//g' > Model4/6650.txt
grep "6652 T" Model4/Model_4.out | grep "p6" | sed 's/#//g' > Model4/6652.txt
grep "6654 T" Model4/Model_4.out | grep "p6" | sed 's/#//g' > Model4/6654.txt
gens="6656 6659"
for gen in $gens;do
gen_mod=$gen" T"
grep "$gen_mod" Model4/Model_4.out | grep "p7" | sed 's/#//g' > Model4/${gen}.txt
done




