---
description: A step by step instruction on how to get and process stock price data for analysis
---

1. Use firecrawl and context7 and GitHub tool to crawl and search for vnstock doc. First priority is this link https://raw.githubusercontent.com/gahoccode/docs/refs/heads/main/thinh-vu-vnstock.md


Load data, set default date range and symbols

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

3. Set default values for parameters and global variables

risk_free_rate=0.02
risk_aversion=1
start_date = '2024-01-01'
end_date = '2025-03-19'
interval = '1D'
source='VCI'

4. Calculate returns using PyPortfolioOpt library
from pypfopt.expected_returns import returns_from_prices
log_returns=False
returns = returns_from_prices(prices_df, log_returns=log_returns)