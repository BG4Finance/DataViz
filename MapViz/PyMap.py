import pandas as pd
import folium

# Load the shape of the zone (US states)
# Find the original file here: https://github.com/python-visualization/folium/tree/master/examples/data
# You have to download this file and set the directory where you saved it
state_geo = str('/Users/Barbarossa/Documents/GitHub/DataViz/MapViz/world-countries.json')

# Load the unemployment value of each state
# Find the original file here: https://github.com/python-visualization/folium/tree/master/examples/data
state_GDP = str('/Users/Barbarossa/Documents/GitHub/DataViz/MapViz/GDPPC.csv')
state_data = pd.read_csv(state_GDP)
state_data = state_data.loc[:, ['Country_Code', 'YR2014']]

# Initialize the map:
m = folium.Map(location = [0,0], zoom_start = 1)

# Add the color for the chloropleth:
m.choropleth(
 geo_data=state_geo,
 name='choropleth',
 data=state_data,
 columns=['Country_Code', 'YR2014'],
 key_on='feature.id',
 fill_color='RdYlBu',
 fill_opacity=0.7,
 line_opacity=0.2,
 legend_name='GDP per Capita'
)
folium.LayerControl().add_to(m)

# Save to html
m.save('#folium_World_GDP.html')
