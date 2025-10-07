import requests

def get_cta_label():
    url = "https://api-prod.prod.cms.df.services.vodafone.com.au/plan/postpaid-simo"
    params = {
        "serviceType": "New"
    }
    
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()
        
        data = response.json()

        plans = data['planListing']['plans']
        store_list = []
        for plan in plans:
            store_list.append(plan['ctaLabel'])

        return store_list
        
    except requests.exceptions.RequestException as e:
        print(f"Error making request: {e}")
        return None