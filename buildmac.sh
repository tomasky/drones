 cd "build/source/release"
       mkdir -p nvim-osx64/libs
          libs=($(otool -L nvim-osx64/bin/nvim | sed 1d | sed -E -e 's|^[[:space:]]*||' -e 's| .*||'))
          echo "libs:"
          for lib in "${libs[@]}"; do
            if echo "$lib" | grep -q -E 'libSystem|CoreFoundation' 2>/dev/null; then
              echo "  [skipped] $lib"
            else
              echo "  $lib"
              relname="libs/${lib##*/}"
              cp -L "$lib" "nvim-osx64/$relname"
              install_name_tool -change "$lib" "@executable_path/../$relname" nvim-osx64/bin/nvim
            fi
          done
          tar cfz nvim-macos.tar.gz nvim-osx64
