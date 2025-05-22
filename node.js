const simpleGit = require('simple-git');
const git = simpleGit();

async function mergeAndDelete() {
  try {
    console.log("Přepínám na 'master'...");
    await git.checkout('master');

    console.log("Stahuji nejnovější změny...");
    await git.pull('origin', 'master');

    console.log("Merguju 'feature' do 'master'...");
    await git.merge(['feature']);

    console.log("Pushuju na vzdálený 'master'...");
    await git.push('origin', 'master');

    console.log("Mažu lokální větev 'feature'...");
    await git.deleteLocalBranch('feature');

    console.log("Zkouším smazat vzdálenou větev 'feature'...");
    try {
      await git.push(['origin', '--delete', 'feature']);
    } catch (err) {
      console.log("Větev na serveru neexistuje nebo již byla smazána.");
    }

    console.log("✅ Hotovo!");
  } catch (err) {
    console.error("❌ Chyba:", err.message);
  }
}

mergeAndDelete();
