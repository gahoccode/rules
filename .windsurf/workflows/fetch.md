---
description: A step by step instruction on how to get and process stock price data for analysis
---

1. Load data, set default date range and symbols

from vnstock import Quote
import pandas as pd

# Define the symbols you want to fetch data for
symbols = ['REE', 'FMC', 'DHC']
print(f"Fetching historical price data for: {symbols}")

# Dictionary to store historical data for each symbol
all_historical_data = {}

# Set date range
start_date = '2024-01-01'
end_date = '2025-03-19'
interval = '1D'

# Fetch historical data for each symbol
for symbol in symbols:
    try:
        print(f"\nProcessing {symbol}...")
        quote = Quote(symbol=symbol)
        
        # Fetch historical price data
        historical_data = quote.history(
            start=start_date,
            end=end_date,
            interval=interval,
            to_df=True
        )
        
        if not historical_data.empty:
            all_historical_data[symbol] = historical_data
            print(f"Successfully fetched {len(historical_data)} records for {symbol}")
        else:
            print(f"No historical data available for {symbol}")
    except Exception as e:
        print(f"Error fetching data for {symbol}: {e}")

# Display sample data from each symbol
if all_historical_data:
    for symbol, data in all_historical_data.items():
        if not data.empty:
            print(f"\nSample data for {symbol}:")
            print(data.head(3))
else:
    print("No historical data was fetched for any symbol.")

2. Process data 
combined_prices_indexed = combined_prices.copy()
combined_prices_indexed['time'] = pd.to_datetime(combined_prices_indexed['time'])
combined_prices_indexed.set_index('time', inplace=True)

# 1. Make a copy of the combined_prices DataFrame
prices_df = combined_prices.copy()

# 2. Convert the 'time' column to datetime if it's not already
prices_df['time'] = pd.to_datetime(prices_df['time'])

# 3. Set the 'time' column as the index
prices_df.set_index('time', inplace=True)

# 4. Extract only the close price columns and rename them to just the symbol names
close_price_columns = [col for col in prices_df.columns if '_close' in col]
prices_df = prices_df[close_price_columns]
prices_df.columns = [col.replace('_close', '') for col in close_price_columns]

# 5. Make sure there are no NaN values
prices_df = prices_df.dropna()

3. Set default values for parameters

risk_free_rate=0.02
risk_aversion=1

4. Calculate returns 
from pypfopt.expected_returns import returns_from_prices
log_returns=False
returns = returns_from_prices(prices_df, log_returns=log_returns)