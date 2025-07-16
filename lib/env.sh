#!/usr/bin/env bash
# Modular environment loader for scripts collection
# Usage: load_env "colors,fzf,paths" or load_env "colors" etc.

load_env() {
    local modules="${1:-core}"
    
    # Core environment (load once)
    if [[ -z "$SCRIPTS_ENV_LOADED" ]]; then
        export SCRIPTS_ENV_LOADED=1
        export SCRIPTS="${SCRIPTS:-$(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")")}"
    fi
    
    # Paths module
    if [[ "$modules" == *"paths"* ]] || [[ "$modules" == *"core"* ]]; then
        export SCRIPT_PATHS="$SCRIPTS/bin:/usr/local/bin:$HOME/.local/bin"
        # Add to PATH if not already there
        [[ ":$PATH:" != *":$SCRIPTS/bin:"* ]] && export PATH="$SCRIPTS/bin:$PATH"
        [[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"
    fi
    
    # Colors module (Flexoki palette)
    if [[ "$modules" == *"colors"* ]]; then
        export FLEXOKI_LOADED=1
        
        # Flexoki colors
        export FLEXOKI_BLACK="#100f0f"
        export FLEXOKI_BG="#1c1b1a"
        export FLEXOKI_BG2="#282726"
        export FLEXOKI_TX="#cecdc3"
        export FLEXOKI_TX2="#b7b5ac"
        export FLEXOKI_TX3="#878580"
        export FLEXOKI_UI="#403e3c"
        export FLEXOKI_UI2="#575653"
        export FLEXOKI_UI3="#6f6e69"
        export FLEXOKI_WHITE="#fffcf0"
        
        # Semantic colors
        export FLEXOKI_RED="#af3029"
        export FLEXOKI_ORANGE="#bc5215"
        export FLEXOKI_YELLOW="#ad8301"
        export FLEXOKI_GREEN="#66800b"
        export FLEXOKI_CYAN="#24837b"
        export FLEXOKI_BLUE="#205ea6"
        export FLEXOKI_PURPLE="#5e409d"
        export FLEXOKI_MAGENTA="#a02f6f"
        
        # Common color aliases for scripts
        export PRIMARY_COLOR="$FLEXOKI_BLUE"
        export SUCCESS_COLOR="$FLEXOKI_GREEN"
        export WARNING_COLOR="$FLEXOKI_YELLOW"
        export ERROR_COLOR="$FLEXOKI_RED"
        export ACCENT_COLOR="$FLEXOKI_PURPLE"
    fi
    
    # FZF module
    if [[ "$modules" == *"fzf"* ]]; then
        export FZF_ENV_LOADED=1
        
        # Core FZF settings
        export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude node_modules"
        
        # FZF colors using Flexoki palette
        if [[ -n "$FLEXOKI_LOADED" ]]; then
            export FZF_DEFAULT_OPTS="
                --height 40% 
                --border
                --reverse
                --bind 'ctrl-/:toggle-preview'
                --bind 'ctrl-u:preview-page-up'
                --bind 'ctrl-d:preview-page-down'
                --color=fg:${FLEXOKI_TX#\#}
                --color=bg:${FLEXOKI_BG#\#}
                --color=hl:${FLEXOKI_BLUE#\#}
                --color=fg+:${FLEXOKI_WHITE#\#}
                --color=bg+:${FLEXOKI_UI#\#}
                --color=hl+:${FLEXOKI_CYAN#\#}
                --color=info:${FLEXOKI_YELLOW#\#}
                --color=prompt:${FLEXOKI_BLUE#\#}
                --color=pointer:${FLEXOKI_PURPLE#\#}
                --color=marker:${FLEXOKI_MAGENTA#\#}
                --color=spinner:${FLEXOKI_YELLOW#\#}
                --color=header:${FLEXOKI_TX2#\#}
                --color=border:${FLEXOKI_UI2#\#}
            "
        else
            export FZF_DEFAULT_OPTS="
                --height 40% 
                --border
                --reverse
                --bind 'ctrl-/:toggle-preview'
                --bind 'ctrl-u:preview-page-up'
                --bind 'ctrl-d:preview-page-down'
            "
        fi
        
        # FZF preview command
        export FZF_PREVIEW_COMMAND="bat --style=numbers --color=always --line-range :500 {}"
    fi
    
    # Git module - just the paths scripts need
    if [[ "$modules" == *"git"* ]]; then
        export GIT_REPOS="${GIT_REPOS:-$HOME/git}"
        export LOCALDATA="${LOCALDATA:-$HOME/.local/share/localdata}"
    fi
    
    # Debug module (for development)
    if [[ "$modules" == *"debug"* ]]; then
        export DEBUG_ENV=1
        echo "Environment loaded: $modules" >&2
        echo "SCRIPTS: $SCRIPTS" >&2
        echo "PATH additions: $SCRIPTS/bin" >&2
        [[ -n "$FLEXOKI_LOADED" ]] && echo "Colors: Flexoki palette loaded" >&2
        [[ -n "$FZF_ENV_LOADED" ]] && echo "FZF: Custom settings loaded" >&2
    fi
}

# Convenience functions for common combinations
load_env_minimal() { load_env "core"; }
load_env_colors() { load_env "core,colors"; }
load_env_fzf() { load_env "core,colors,fzf"; }
load_env_full() { load_env "core,colors,fzf,git,paths"; }

# Export the main function for use in scripts
export -f load_env load_env_minimal load_env_colors load_env_fzf load_env_full