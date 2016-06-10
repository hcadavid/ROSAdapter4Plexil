/*
 * Copyright (C) 2016 hcadavid
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* 
 * File:   stdoutbytestrans.c
 * Author: hcadavid
 *
 * Created on June 10, 2016, 6:07 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <iostream>

using namespace std;

using std::cout;
using std::endl;
using std::string;
using std::pair;

bool  interfaceSetup(){
    std::cout << "Setting up Stdin/Stdout interface "<< std::endl;
    return true;
}

void sendData(char v){
    std::cout << "[CMD] " << v << std::endl;
    std::cout.flush();    
}

bool receiveNextInput(std::string& line){    
    return std::getline(std::cin, line);    
    
}


/*
 * 
 */
int main(int argc, char** argv) {

    std::string line;
    
    while(receiveNextInput(line)){
        cout << line << endl;
    }
    
    
    return (EXIT_SUCCESS);
}


