import pandas as pd
import matplotlib.pyplot as plt

# Data from your table
data = {
    'customer_segment': ['HIGH VALUE', 'MID VALUE', 'LOW VALUE'],
    'total_ltv': [135429277.27, 66636451.79, 4341809.53]
}

# Create DataFrame
df = pd.DataFrame(data)

# Plot pie chart
plt.figure(figsize=(7, 7))
plt.pie(
    df['total_ltv'],
    labels=df['customer_segment'],
    autopct='%1.1f%%',
    startangle=90,
    shadow=True
)

plt.title('Customer Segment Contribution by Total LTV')
plt.savefig('customer_segmentation.png', bbox_inches='tight')
plt.show()