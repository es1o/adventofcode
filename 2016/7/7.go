package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strings"
)

func solve(line string) bool {
	var res bool = false
	t := regexp.MustCompile(`\[\w*\]`)
	// check outside []
	s := t.Split(line, -1)
	for i := 0; i < len(s); i++ {
		if check(s[i]) {
			res = true
		}
	}
	// check inside []
	x := t.FindAllString(line, -1)
	fmt.Println(x)
	for i := 0; i < len(x); i++ {
		if check(x[i]) {
			res = false
		}
	}
	return res
}

func check(addr string) bool {
	res := false
	a := strings.Split(addr, "")
	fmt.Println(a)
	if len(a) < 4 {
		res = false
	}
	for i := 0; i < len(a)-3; i++ {
		if a[i] == a[i+3] && a[i+1] == a[i+2] && a[i] != a[i+1] {
			res = true
		}
		if a[i] == a[i+3] && a[i+1] == a[i+2] && a[i] == a[i+1] {
			return false
		}
	}
	return res
}

func main() {
	var part1 int = 0
	// file, _ := os.Open("test.txt")
	file, _ := os.Open("input.txt")
	defer file.Close()

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		if solve(scanner.Text()) {
			part1++
		}
	}

	fmt.Printf("Part1: %d", part1)

}
