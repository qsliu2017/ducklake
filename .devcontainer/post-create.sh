#!/bin/bash
set -e

echo "🚀 Setting up DuckLake development environment..."

echo "📦 Initializing git submodules..."
git submodule update --init --recursive --fetch-depth=0

cd duckdb && git checkout v1.4-andium

GEN=ninja make release
