﻿<#
.SYNOPSIS
        Update the Daily GitHub
.DESCRIPTION
        This PowerShell script writes the Daily GitHub to the standard output.
.EXAMPLE
        PS> ./update > README.md
.LINK
        https://github.com/fleschutz/whats-new
.NOTES
        Author: Markus Fleschutz | License: CC0
#>

function Repo([string]$name, [string]$URLpart) {
	Start-Sleep -seconds 1
	$releases = (Invoke-WebRequest -URI https://api.github.com/repos/$URLpart/releases?per_page=1 -userAgent "curl" -useBasicParsing).Content | ConvertFrom-Json
	foreach($release in $releases) {
		"* [$name](https://github.com/$URLpart) $($release.name)"
		return
	}
	$tags = (Invoke-WebRequest -URI https://api.github.com/repos/$URLpart/tags?per_page=1 -userAgent "curl" -useBasicParsing).Content | ConvertFrom-Json
	foreach($tag in $tags) {
		"* [$name](https://github.com/$URLpart) $($tag.name)"
		return
	}
}

try {
	"The Daily GitHub - Latest Releases as of SEP 20"
	"==============================================="
	Repo "Bazel"              "bazelbuild/bazel"
	Repo "cmake"              "Kitware/CMake"
	Repo "curl"               "curl/curl"
	Repo "Go"                 "golang/go"
	Repo "Gradle"             "gradle/gradle"
	Repo "Grafana"            "grafana/grafana"
	Repo "Homebrew"           "Homebrew/brew"
	Repo "Hugo"               "gohugoio/hugo"
	Repo "Jenkins"            "jenkinsci/jenkins"
	Repo "Julia"              "JuliaLang/julia"
	Repo "Kotlin"             "JetBrains/kotlin"
	Repo "Kubernetes"         "kubernetes/kubernetes"
	Repo "Linux kernel"       "torvalds/linux"
	Repo "LLVM"               "llvm/llvm-project"
	Repo "Mastodon"           "mastodon/mastodon"
	Repo "Ninja"              "ninja-build/ninja"
	Repo "OBS Studio"         "obsproject/obs-studio"
	Repo "OpenCV"             "opencv/opencv"
	Repo "PowerShell"         "PowerShell/PowerShell"
	Repo "PowerToys"          "microsoft/PowerToys"
	Repo "Redis"              "redis/redis"
	Repo "Ruby on Rails"      "rails/rails"
	Repo "Rust"               "rust-lang/rust"
	Repo "Scala"              "scala/scala"
	Repo "Smartmontools"      "smartmontools/smartmontools"
	Repo "Swift"              "swiftlang/swift"
	Repo "TinyCC"             "TinyCC/tinycc"
	Repo "TypeScript"         "microsoft/TypeScript"
	Repo "Vim"                "vim/vim"
	Repo "Visual Studio Code" "microsoft/vscode"
	Repo "Windows Terminal"   "microsoft/terminal"
	Repo "ZFS"                "openzfs/zfs"
	""
	"Generated automatically by script update.ps1."
	exit 0 # success
} catch {
}