import fetch from 'node-fetch';

async function getUser() {
  try {
    const response = await fetch('https://plugcrm.net/api/v1/deals?token=6064a94d796c0b00167e37d8');

    if (!response.ok) {
      throw new Error(`Error! status: ${response.status}`);
    }

    const result = await response.json();
    return result;
  } catch (err) {
    console.log(err);
  }
}

console.log(await getUser());
