import { render, screen } from '@testing-library/react';
import App from './App';

test('renders NewsRadar heading', () => {
  render(<App />);
  const heading = screen.getByText(/NewsRadar/i);
  expect(heading).toBeInTheDocument();
});
