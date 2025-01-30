# **Water Sort Puzzle Solver Using Iterative Deepening Search (IDS)**  

## **Project Overview**  
This project implements a **Water Sort Puzzle Solver** using **Iterative Deepening Search (IDS)**. The Water Sort Puzzle consists of multiple bottles containing liquid layers of different colors. The objective is to arrange each bottle so that it contains only one color.  

The solver applies **search-based AI techniques** to explore different sequences of pouring actions until the puzzle is solved. The implementation follows logical rules for valid pouring and ensures an efficient search strategy to find solutions.  

## **Team Members**  
- Ahmed Yousry  
- Mohamed Amr  
- Dalia Hesham  
- Aya Wael  

## **Key Features**  
✅ **State Representation:** Represents the configuration of the puzzle using a structured state format.  
✅ **Successor State Axioms:** Defines valid transitions from one state to another based on pouring rules.  
✅ **Action Validation:** Ensures each move follows the logical constraints of the puzzle.  
✅ **Iterative Deepening Search (IDS):** Implements an efficient search strategy to explore solutions while avoiding infinite loops.  
✅ **Performance Measurement:** Tracks execution time and validates the correctness of solutions.  

## **Project Structure** 
📂 WaterSortSolver
├── 📄 main.pl # Prolog implementation of the puzzle solver
├── 📄 test_cases.pl # Sample test cases for verifying the solution
├── 📄 README.md # Project documentation
├── 📄 report.pdf # Detailed project report
├── 📄 results.txt # Output of test cases

## **Implementation Details**  

### **1. State Representation (Fluent Representation)**  
The puzzle state is represented as:  
   state(B1, B2, B3, S)
Where:  
- B1, B2, B3 represent the state of each bottle (list of liquid layers).  
- S represents the sequence of actions taken to reach the current state.  

### **2. Successor State Axioms**  
Defines the effect of a **pour(X, Y)** action, ensuring valid transitions:  

state(B1, B2, B3, result(pour(X,Y), S)) :-  
       state(B1P, B2P, B3P, S),  
       pourvalid(X, Y, B1P, B2P, B3P, B1, B2, B3).

3. Pouring Rules
A liquid can be poured if:
✔ The source bottle is not empty.
✔ The target bottle is either empty or has a matching top liquid layer.
✔ The pour action results in a valid new state.

4. Iterative Deepening Search (IDS)
IDS is used to prevent infinite loops and optimize search performance.
If no solution is found within a maximum depth limit, the algorithm returns false.
IDS dynamically adjusts the depth of search until a solution is found or the maximum limit is reached.

