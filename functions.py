import requests
import pandas as pd
import pycountry
pd.set_option('display.max_columns', None)

def drop_first_row(df):
    """
    Drops the first row of a DataFrame.
    
    """
    df = df.drop(df.index[0])
    return df

def rename_columns(df):
    """
    Rename DataFrame columns to lowercase and replace spaces with underscores.

    """
    # Convert column names to lowercase and replace spaces with underscores
    new_columns = [col.lower().replace(' ', '_') for col in df.columns]
    
    # Rename columns
    df.columns = new_columns
    
    return df

def get_country_iso(df):
    """
    Retrieves the ISO numeric code for a given country name.
    Assumes the DataFrame has a column named 'country' containing country names.
    
    """
    def iso_lookup(country_name):
        if pd.isna(country_name):
            return None
        
        iso_mapping = {
            "Occupied Palestinian Territories": "275",
            "DR Congo": "180",
            "Chechnya": "643",
            "Cote D'Ivoire": "384",
            "Libyan Arab Jamahiriya": "434",
            "Kosovo": "0",
            "Turkey": "792",
            "Kashmir": "586",
            "Swaziland": "748"
        }

        if country_name in iso_mapping:
            return iso_mapping[country_name]
        else:
            try:
                country = pycountry.countries.lookup(country_name)
                return country.numeric
            except LookupError:
                return None

    if 'country' not in df.columns:
        raise ValueError("DataFrame doesn't have a 'country' column.")

    df['country_iso'] = df['country'].apply(iso_lookup)
    return df

def isolate_unique_df(df):
    """
    Preprocesses a DataFrame by selecting specific columns, removing duplicates and NaN values, 
    resetting index, and converting 'year' column to integer type.

    """
    unique_df = df[['year', 'country_iso']].copy()
    unique_df.drop_duplicates(inplace=True)
    unique_df.dropna(inplace=True)
    unique_df.reset_index(drop=True, inplace=True)
    unique_df['year'] = unique_df['year'].astype(int)
    
    return unique_df

def check_coverage(country, year):
    """
    Checks if a given country and year are within the coverage period.
    
    """
    coverage_dict = {
    # East Asia
    "156": (2018, 2024),  # China
    "392": (2018, 2024),  # Japan
    "496": (2018, 2024),  # Mongolia
    "408": (2018, 2024),  # North Korea
    "410": (2018, 2024),  # South Korea
    "158": (2018, 2024),  # Taiwan
    
    # Central Asia & the Caucasus
    "004": (2017, 2024),  # Afghanistan
    "051": (2018, 2024),  # Armenia
    "031": (2018, 2024),  # Azerbaijan
    "268": (2018, 2024),  # Georgia
    "398": (2018, 2024),  # Kazakhstan
    "417": (2018, 2024),  # Kyrgyzstan
    "762": (2018, 2024),  # Tajikistan
    "795": (2018, 2024),  # Turkmenistan
    "860": (2018, 2024),  # Uzbekistan
    
    # Europe
    "008": (2018, 2024),  # Albania
    "020": (2020, 2024),  # Andorra
    "040": (2020, 2024),  # Austria
    "826": (2020, 2024),  # United Kingdom
    "056": (2020, 2024),  # Belgium
    "070": (2018, 2024),  # Bosnia and Herzegovina
    "100": (2018, 2024),  # Bulgaria
    "191": (2018, 2024),  # Croatia
    "196": (2018, 2024),  # Cyprus
    "203": (2020, 2024),  # Czech Republic
    "208": (2020, 2024),  # Denmark
    "233": (2020, 2024),  # Estonia
    "234": (2020, 2024),  # Faroe Islands
    "246": (2020, 2024),  # Finland
    "250": (2020, 2024),  # France
    "276": (2020, 2024),  # Germany
    "292": (2020, 2024),  # Gibraltar
    "300": (2018, 2024),  # Greece
    "304": (2020, 2024),  # Greenland
    "348": (2020, 2024),  # Hungary
    "352": (2020, 2024),  # Iceland
    "372": (2020, 2024),  # Ireland
    "833": (2020, 2024),  # Isle of Man
    "380": (2020, 2024),  # Italy
    "XK": (2018, 2024),   # Kosovo
    "428": (2020, 2024),  # Latvia
    "438": (2020, 2024),  # Liechtenstein
    "440": (2020, 2024),  # Lithuania
    "442": (2020, 2024),  # Luxembourg
    "470": (2020, 2024),  # Malta
    "498": (2018, 2024),  # Moldova
    "492": (2020, 2024),  # Monaco
    "499": (2018, 2024),  # Montenegro
    "528": (2020, 2024),  # Netherlands
    "807": (2018, 2024),  # North Macedonia
    "578": (2020, 2024),  # Norway
    "616": (2020, 2024),  # Poland
    "620": (2020, 2024),  # Portugal
    "642": (2018, 2024),  # Romania
    "643": (2018, 2024),  # Russia
    "674": (2020, 2024),  # San Marino
    "688": (2018, 2024),  # Serbia
    "703": (2020, 2024),  # Slovakia
    "705": (2020, 2024),  # Slovenia
    "724": (2020, 2024),  # Spain
    "752": (2020, 2024),  # Sweden
    "756": (2020, 2024),  # Switzerland
    "804": (2018, 2024),  # Ukraine
    "826": (2020, 2024),  # United Kingdom
    "336": (2020, 2024),  # Vatican City
    
    # Middle East
    "760": (2017, 2024),  # Syria
    "368": (2016, 2024),  # Iraq
    "792": (2016, 2024),  # Turkey
    "364": (2016, 2024),  # Iran
    "682": (2015, 2024),  # Saudi Arabia
    "887": (2015, 2024),  # Yemen
    "784": (2016, 2024),  # United Arab Emirates
    "376": (2016, 2024),  # Israel
    "400": (2016, 2024),  # Jordan
    "275": (2016, 2024),  # Palestinian Territories
    "422": (2016, 2024),  # Lebanon
    "512": (2016, 2024),  # Oman
    "414": (2016, 2024),  # Kuwait
    "634": (2016, 2024),  # Qatar
    "048": (2016, 2024),  # Bahrain
    
    # South & Southeast Asia
    "050": (2010, 2024),  # Bangladesh
    "064": (2020, 2024),  # Bhutan
    "096": (2020, 2024),  # Brunei
    "116": (2010, 2024),  # Cambodia
    "626": (2020, 2024),  # East Timor
    "356": (2016, 2024),  # India
    "360": (2015, 2024),  # Indonesia
    "418": (2010, 2024),  # Laos
    "458": (2018, 2024),  # Malaysia
    "462": (2020, 2024),  # Maldives
    "104": (2010, 2024),  # Myanmar
    "524": (2010, 2024),  # Nepal
    "586": (2010, 2024),  # Pakistan
    "608": (2016, 2024),  # Philippines
    "702": (2020, 2024),  # Singapore
    "144": (2010, 2024),  # Sri Lanka
    "764": (2010, 2024),  # Thailand
    "704": (2010, 2024),  # Vietnam
    
    # Africa
    "012": (1997, 2024),  # Algeria
    "024": (1997, 2024),  # Angola
    "204": (1997, 2024),  # Benin
    "072": (1997, 2024),  # Botswana
    "086": (2018, 2024),  # British Indian Ocean Territory
    "854": (1997, 2024),  # Burkina Faso
    "108": (1997, 2024),  # Burundi
    "120": (1997, 2024),  # Cameroon
    "132": (2020, 2024),  # Cape Verde
    "140": (1997, 2024),  # Central African Republic
    "148": (1997, 2024),  # Chad
    "174": (2020, 2024),  # Comoros
    "180": (1997, 2024),  # Democratic Republic of Congo
    "178": (1997, 2024),  # Republic of Congo
    "384": (1997, 2024),  # Cote d'Ivoire
    "262": (1997, 2024),  # Djibouti
    "818": (1997, 2024),  # Egypt
    "226": (1997, 2024),  # Equatorial Guinea
    "232": (1997, 2024),  # Eritrea
    "748": (1997, 2024),  # eSwatini
    "231": (1997, 2024),  # Ethiopia
    "266": (1997, 2024),  # Gabon
    "270": (1997, 2024),  # Gambia
    "288": (1997, 2024),  # Ghana
    "324": (1997, 2024),  # Guinea
    "624": (1997, 2024),  # Guinea-Bissau
    "404": (1997, 2024),  # Kenya
    "426": (1997, 2024),  # Lesotho
    "430": (1997, 2024),  # Liberia
    "434": (1997, 2024),  # Libya
    "450": (1997, 2024),  # Madagascar
    "454": (1997, 2024),  # Malawi
    "466": (1997, 2024),  # Mali
    "478": (1997, 2024),  # Mauritania
    "480": (2020, 2024),  # Mauritius
    "175": (2020, 2024),  # Mayotte
    "504": (1997, 2024),  # Morocco
    "508": (1997, 2024),  # Mozambique
    "516": (1997, 2024),  # Namibia
    "562": (1997, 2024),  # Niger
    "566": (1997, 2024),  # Nigeria
    "638": (2020, 2024),  # Réunion
    "654": (2020, 2024),  # Saint Helena, Ascension, and Tristan da Cunha
    "678": (2020, 2024),  # São Tomé and Príncipe
    "686": (1997, 2024),  # Senegal
    "690": (2020, 2024),  # Seychelles
    "694": (1997, 2024),  # Sierra Leone
    "706": (1997, 2024),  # Somalia
    "710": (1997, 2024),  # South Africa
    "728": (2011, 2024),  # South Sudan
    "729": (1997, 2024),  # Sudan
    "834": (1997, 2024),  # Tanzania
    "768": (1997, 2024),  # Togo
    "788": (1997, 2024),  # Tunisia
    "800": (1997, 2024),  # Uganda
    "894": (1997, 2024),  # Zambia
    "716": (1997, 2024),  # Zimbabwe
    
    # Latin America & the Caribbean
    "630": (2018, 2024),  # Puerto Rico (USA)
    "312": (2018, 2024),  # Guadeloupe (France)
    "474": (2018, 2024),  # Martinique (France)
    "254": (2018, 2024),  # French Guiana (France)
    "531": (2018, 2024),  # Curaçao (Netherlands)
    "533": (2018, 2024),  # Aruba (Netherlands)
    "850": (2018, 2024),  # US Virgin Islands (USA)
    "136": (2018, 2024),  # Cayman Islands
    "534": (2018, 2024),  # Sint Maarten (Netherlands)
    "796": (2018, 2024),  # Turks and Caicos (UK)
    "092": (2018, 2024),  # British Virgin Islands (UK)
    "535": (2018, 2024),  # Caribbean Netherlands (Bonaire, Sint Eustatius, and Saba)
    "660": (2018, 2024),  # Anguilla (UK)
    "500": (2018, 2024),  # Montserrat (UK)
    "238": (2018, 2024),  # Falkland Islands (UK)
    "076": (2018, 2024),  # Brazil
    "484": (2018, 2024),  # Mexico
    "170": (2018, 2024),  # Colombia
    "032": (2018, 2024),  # Argentina
    "604": (2018, 2024),  # Peru
    "862": (2018, 2024),  # Venezuela
    "152": (2018, 2024),  # Chile
    "320": (2018, 2024),  # Guatemala
    "218": (2018, 2024),  # Ecuador
    "192": (2018, 2024),  # Cuba
    "068": (2018, 2024),  # Bolivia
    "332": (2018, 2024),  # Haiti
    "214": (2018, 2024),  # Dominican Republic
    "340": (2018, 2024),  # Honduras
    "600": (2018, 2024),  # Paraguay
    "222": (2018, 2024),  # El Salvador
    "558": (2018, 2024),  # Nicaragua
    "188": (2018, 2024),  # Costa Rica
    "591": (2018, 2024),  # Panama
    "858": (2018, 2024),  # Uruguay
    "388": (2018, 2024),  # Jamaica
    "780": (2018, 2024),  # Trinidad and Tobago
    "328": (2018, 2024),  # Guyana
    "740": (2018, 2024),  # Suriname
    "044": (2018, 2024),  # Bahamas
    "084": (2018, 2024),  # Belize
    "052": (2018, 2024),  # Barbados
    "662": (2018, 2024),  # Saint Lucia
    "670": (2018, 2024),  # St. Vincent & Grenadines
    "308": (2018, 2024),  # Grenada
    "028": (2018, 2024),  # Antigua & Barbuda
    "212": (2018, 2024),  # Dominica
    "652": (2018, 2024),  # Saint-Barthelemy
    "663": (2018, 2024),  # Saint-Martin
    "659": (2018, 2024),  # Saint Kitts & Nevis
    "239": (2018, 2024),  # South Georgia and the South Sandwich Islands (UK)
    
    # North America
    "124": (2021, 2024),  # Canada
    "060": (2021, 2024),  # Bermuda (UK)
    "666": (2021, 2024),  # Saint Pierre and Miquelon (France)
    "840": (2020, 2024),  # United States
    
    # Oceania
    "036": (2021, 2024),  # Australia
    "554": (2021, 2024),  # New Zealand
    "242": (2021, 2024),  # Fiji
    "540": (2021, 2024),  # New Caledonia (France)
    "548": (2021, 2024),  # Vanuatu
    "090": (2021, 2024),  # Solomon Islands
    "598": (2021, 2024),  # Papua New Guinea
    "583": (2021, 2024),  # Micronesia
    "316": (2021, 2024),  # Guam (US)
    "520": (2021, 2024),  # Nauru
    "584": (2021, 2024),  # Marshall Islands
    "296": (2021, 2024),  # Kiribati
    "585": (2021, 2024),  # Palau
    "580": (2021, 2024),  # Northern Mariana Islands (US)
    "016": (2021, 2024),  # American Samoa (US)
    "184": (2021, 2024),  # Cook Islands
    "258": (2021, 2024),  # French Polynesia (France)
    "574": (2021, 2024),  # Norfolk Island (Australia)
    "570": (2021, 2024),  # Niue
    "882": (2021, 2024),  # Samoa
    "776": (2021, 2024),  # Tonga
    "772": (2021, 2024),  # Tokelau (New Zealand)
    "798": (2021, 2024),  # Tuvalu
    "612": (2021, 2024),  # Pitcairn (UK)
    "876": (2021, 2024),  # Wallis and Futuna (France)
    "334": (2021, 2024),  # Heard Island and McDonald Islands (Australia)
    "166": (2021, 2024),  # Cocos (Keeling) Islands (Australia)
    "162": (2021, 2024),  # Christmas Island (Australia)
    "581": (2021, 2024),  # Northern Mariana Islands (USA)
}
    if country in coverage_dict:
        start_year, end_year = coverage_dict[country]
        if start_year <= year <= end_year:
            return True
    return False

def update_country_fatalities(df):
    """
    Update 'country_fatalities' column in the DataFrame if necessary.
    
    """
    for index, row in df.iterrows():
        country = row['country_iso']
        year = row['year']
        if not check_coverage(country, year):
            df.at[index, 'country_fatalities'] = 'no data available'
    return df

def fill_na(df): 
    """
    Fill missing values in specified columns of a DataFrame with predefined fill values.

    """
    columns_to_fill = ['country', 'country_code', 'latitude', 'longitude', 
                       'actor_name', 'actor_type', 'motive', 'verified', 'icrc', 
                       'nrcs_and_ifrc', 'nngo', 'region', 'district', 'city']

    fill_values = {'country': 'Unknown', 'country_code': 'Unknown', 'latitude': 'Unknown', 
                   'longitude': 'Unknown', 'actor_name': 'Unknown', 'actor_type': 'Unknown', 
                   'motive': 'Unknown', 'verified': 'Pending', 'icrc': 0, 'nrcs_and_ifrc': 0, 
                   'nngo': 0, 'region': 'Unknown', 'district': 'Unknown', 'city': 'Unknown'}

    for col in columns_to_fill:
        df[col].fillna(fill_values[col], inplace=True)
    return df

def fill_month_and_day(df):
    """
    Fill missing values in 'month' and 'day' columns of a DataFrame by backward filling.

    """
    df['month'].bfill(inplace=True)
    df['day'].bfill(inplace=True)
    return df

def standardise_columns(df):
    """
    Standardize values in certain columns of a DataFrame.

    """
    df.loc[df['country'] == 'Chechnya', 'country_code'] = 'RU'
    df.loc[df['country'] == 'Kashmir', 'country_code'] = 'PK'
    df.loc[df['country'] == 'Namibia', 'country_code'] = 'NA'
    df['verified'] = df['verified'].replace("Pen", "Pending")
    df['source'] = df['source'].replace(["Offiicial Report", 'Official Report '], "Official Report")
    df['source'] = df['source'].replace(["media", "Focal point", 'ACLED '], ["Media", "Focal Point", 'ACLED'])
    return df

def convert_columns_to_int(df):
    """
    Convert specified columns to integer type in a DataFrame.

    """
    columns_to_convert = ['year', 'month', 'un', 'ingo', 'icrc', 'nrcs_and_ifrc', 'nngo', 'other',
                     'nationals_killed', 'nationals_wounded', 'nationals_kidnapped', 'total_nationals',
                     'internationals_killed', 'internationals_wounded', 'internationals_kidnapped',
                     'total_internationals', 'total_killed', 'total_wounded', 'total_kidnapped',
                     'total_affected', 'gender_male', 'gender_female', 'gender_unknown']
    df[columns_to_convert] = df[columns_to_convert].astype(int)
    return df