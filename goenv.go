package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
)

var (
	author bool
)

func init() {
	flag.BoolVar(&author, "author", false, "关于本软件开发者")
	flag.Parse()
}

func main() {
	if author {
		Author()
		return
	}
	d := &DockerGoEnv{
		Image:        "xiaoqidun/goenv",
		Binary:       "docker",
		WorkDir:      "/go/src/app",
		AutoDelete:   true,
		MountWorkDir: true,
	}
	d.Run()
}

func Author() {
	fmt.Println("welcome to our website https://aite.xyz/")
	fmt.Println("----------------------------------------")
	fmt.Println("腾讯扣扣：88966001")
	fmt.Println("电子邮箱：xiaoqidun@gmail.com")
}

type DockerGoEnv struct {
	Image        string
	Binary       string
	CmdArgs      []string
	WorkDir      string
	AutoDelete   bool
	MountWorkDir bool
}

func (d *DockerGoEnv) Run() {
	d.CmdArgs = []string{"run", "-it"}
	if d.AutoDelete {
		d.CmdArgs = append(d.CmdArgs, "--rm")
	}
	if d.MountWorkDir {
		if pwd, err1 := os.Getwd(); err1 == nil {
			d.CmdArgs = append(d.CmdArgs, "-v", pwd+":"+d.WorkDir, "-w", d.WorkDir)
		}
	}
	d.CmdArgs = append(d.CmdArgs, d.Image)
	cmd := exec.Command(d.Binary, d.CmdArgs...)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	_ = cmd.Run()
}
