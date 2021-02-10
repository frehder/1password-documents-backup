
# Backup 1Password documents

Simple bash script to download all documents from 1Password subscription account vault.

I created this tool for myself to backup the documents from my 1Password account.

## Requirements

1. [1Password CLI tool *op*](https://support.1password.com/command-line-getting-started/)
2. [*jq* json tool](https://shapeshed.com/jq-json/) (Install on Mac: `brew install jq`)

## How to backup

Step by step guide:

1. Sign in to 1Password account
```bash
eval $(op signin my)
```

2. Save list of documents to file (Replace `Vaultname` with your actual vault name).
```bash
op list documents --vault="Vaultname" > Vaultname.json
```

3. Run backup script (will ask again for your 1Password account password)
```bash
bash 1password-documents-backup.sh Vaultname.json
```

You should now have a `Vaultname.json` file with a list of all documents from your vault and a `/docs` folder next to it with all of your documents in it.

---

## License

MIT License, see LICENSE file.

I do not care what you do with this.

I do not provide any warranty.
