import requests
from bs4 import BeautifulSoup

def safe_get_text(element, default=""):
    """Safely get text from an element, return default if None"""
    return element.text.strip() if element is not None else default

def get_ollama_models():
    url = "https://ollama.com/search"

    try:
        # Send GET request
        response = requests.get(url)
        response.raise_for_status()

        # Parse HTML
        soup = BeautifulSoup(response.text, 'html.parser')

        # Find all model entries
        models = soup.find_all('li', attrs={'x-test-model': ''})

        results = []
        for model in models:
            try:
                # Get basic info with safe checks
                title_element = model.find('span', attrs={'x-test-search-response-title':''})
                title = safe_get_text(title_element)

                a_tag = model.find('a')
                href = a_tag.get('href', '') if a_tag else ''

                desc_element = model.find('p', class_='text-md')
                description = safe_get_text(desc_element)

                # Get capabilities (tags with x-test-capability)
                capabilities = [safe_get_text(span) for span in model.find_all('span', attrs={'x-test-capability': ''})]

                # Get sizes
                sizes = [safe_get_text(span) for span in model.find_all('span', attrs={'x-test-size': ''})]

                # Get stats with safe checks
                pull_element = model.find('span', attrs={'x-test-pull-count':''})
                pull_count = safe_get_text(pull_element)

                tag_element = model.find('span', attrs={'x-test-tag-count':''})
                tag_count = safe_get_text(tag_element)

                updated_element = model.find('span', attrs={'x-test-updated':''})
                updated = safe_get_text(updated_element)

                model_info = {
                    'title': title,
                    'href': f"https://ollama.com{href}" if href else '',
                    'description': description,
                    'capabilities': capabilities,
                    'sizes': sizes,
                    'stats': {
                        'pulls': pull_count,
                        'tags': tag_count,
                        'updated': updated
                    }
                }

                # Only add if we have at least a title
                if title:
                    results.append(model_info)

            except Exception as e:
                print(f"Error processing model: {e}")
                continue

        return results

    except requests.RequestException as e:
        print(f"Error fetching data: {e}")
        return []
    except Exception as e:
        print(f"Error parsing data: {e}")
        return []

# Usage
models = get_ollama_models()
for model in models:
    print("\n" + "="*50)
    print(f"Model: {model['title']}")
    print(f"URL: {model['href']}")
    print(f"Description: {model['description']}")
    print(f"Capabilities: {', '.join(model['capabilities'])}")
    print(f"Sizes: {', '.join(model['sizes'])}")
    print(f"Stats: {model['stats']}")

# Optional: Save to file
import json
with open('ollama_models.json', 'w', encoding='utf-8') as f:
    json.dump(models, f, indent=2, ensure_ascii=False)