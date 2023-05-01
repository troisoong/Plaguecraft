package me.Perrin.SEIRloggingPlugin;

import org.bukkit.Bukkit;
import org.bukkit.plugin.java.JavaPlugin;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;
import org.bukkit.Location;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.scoreboard.Objective;
import org.bukkit.scoreboard.Score;
import org.bukkit.scoreboard.Scoreboard;
import org.bukkit.scoreboard.ScoreboardManager;

public class SEIRloggingPlugin extends JavaPlugin implements Listener {
    Logger trackerLogger = Bukkit.getLogger();

    boolean stopRepeater = true;

    public void onEnable() {
        Bukkit.getServer().getPluginManager().registerEvents(this, this);
        this.trackerLogger.info("TRACKING PLUGIN INITIALISING");
    }

    public void onDisable() {
        this.trackerLogger.info("SHUTTING DOWN TRACKER...");
    }

    @EventHandler
    public void onLogin(PlayerJoinEvent event) {
        final Player thePlayer = event.getPlayer();
        this.stopRepeater = true;
        Location playerSpawnLocation = new Location(thePlayer.getWorld(), thePlayer.getLocation().getBlockX(), thePlayer.getLocation().getBlockY(), thePlayer.getLocation().getBlockZ());
        this.trackerLogger.info(event.getPlayer().getName() + " has logged in");
        this.trackerLogger.info("Welcome " + event.getPlayer().getName() + "!" + "Your current position is: " + playerSpawnLocation);
        thePlayer.sendMessage("Welcome to the SIR model villages!");
        Bukkit.getServer().getScheduler().scheduleSyncRepeatingTask(this, () -> {
            if (SEIRloggingPlugin.this.stopRepeater)
                SEIRloggingPlugin.this.logToFile(thePlayer, thePlayer.getLocation());
            SEIRloggingPlugin.this.scoreboardlogtoFile(thePlayer);
        }, 0L, 20L);
        ScoreboardManager sm = Bukkit.getScoreboardManager();
        Scoreboard s = sm.getMainScoreboard();
    }

    @EventHandler
    public void onQuit(PlayerQuitEvent event) {
        this.stopRepeater = false;
        this.trackerLogger.info(event.getPlayer().getName() + " has left the game");
    }

    //Every objective needs a name: Objective [OBJECTIVE_NAME]
    //Then the name of the scoreboard objective in-game in the brackets. These do not need to match
    //Scores are called by getting the score from the relevant player. It might be easier to assign all
    //the scores to a single player to make this less confusing.
    public void scoreboardlogtoFile(Player currentPlayer) {
        ScoreboardManager manager = Bukkit.getScoreboardManager();
        Scoreboard board = manager.getMainScoreboard();
        Objective objective_output = board.getObjective("Outputs");
        Score scoreS = objective_output.getScore("susceptible");
        Score scoreE = objective_output.getScore("exposed");
        Score scoreI = objective_output.getScore("infectious");
        Score scoreR = objective_output.getScore("recovered");

        try {
            File scoreboardFolder = getDataFolder();
            if (!scoreboardFolder.exists())
                scoreboardFolder.mkdir();
            File scoreboardsaveTo = new File(getDataFolder(), currentPlayer.getPlayer().getDisplayName() + "_scoreboard.log");
            if (!scoreboardsaveTo.exists())
                scoreboardsaveTo.createNewFile();
            Date nowDate = new Date();
            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            FileWriter fw = new FileWriter(scoreboardsaveTo, true);
            PrintWriter pw = new PrintWriter(fw);
            pw.println(format.format(nowDate) + " Susceptible: " + scoreS.getScore() + " Exposed: " + scoreE.getScore() + " Infected: " + scoreI.getScore()+ " Recovered: " + scoreR.getScore());
            // pw.println(format.format(nowDate) + "EA_Distance: " + Bukkit.getScoreboardManager().getMainScoreboard().getObjective("EA_Distance").getScore("NeuronSafari") + " Errors: " + currentPlayer.getScoreboard().getObjective("Errors").getScore("NeuronSafari") + " Time_Taken: " + currentPlayer.getScoreboard().getObjective("Time_Taken").getScore("NeuronSafari"));
            //pw.println(format.format(nowDate) + "EA_Distance: " + currentPlayer.getPlayer().getScoreboard().getScores("EA_Distance") + " Errors: " + currentPlayer.getPlayer().getScoreboard().getScores("Errors") + " Time_Taken: " + currentPlayer.getPlayer().getScoreboard().getScores("Time_Taken"));
            pw.close();
        }   catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void logToFile(Player currentPlayer, Location playerCurrentLocation) {
        try {
            File dataFolder = getDataFolder(); //new File(getDataFolder() + File.separator + currentPlayer.getPlayer().getName());
            if (!dataFolder.exists())
                dataFolder.mkdir();
            File saveTo = new File(getDataFolder(), currentPlayer.getPlayer().getName() + ".log");
            if (!saveTo.exists())
                saveTo.createNewFile();
            int groundHeight = currentPlayer.getWorld().getHighestBlockYAt(playerCurrentLocation);
            Block highestBlock = currentPlayer.getWorld().getBlockAt(playerCurrentLocation.getBlockX(), groundHeight - 1, playerCurrentLocation.getBlockZ());
            Block currentWalkingBlock = currentPlayer.getWorld().getBlockAt(playerCurrentLocation.getBlockX(), playerCurrentLocation.getBlockY() - 1, playerCurrentLocation.getBlockZ());
            Date nowDate = new Date();
            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            FileWriter fw = new FileWriter(saveTo, true);
            PrintWriter pw = new PrintWriter(fw);
            pw.println(format.format(nowDate) + " CurrentLocation(x,y,z): " + playerCurrentLocation.getBlockX() + " " + playerCurrentLocation.getBlockY() + " " + playerCurrentLocation.getBlockZ() + " Head_Direction: " + playerCurrentLocation.getPitch() + " " + playerCurrentLocation.getYaw() + " CurrentWalkingBlock: " + currentWalkingBlock.getType() + " HighestGroundHeight: " + groundHeight + " HighestBlockType: " + highestBlock.getType());
            pw.close();
        }   catch (IOException e) {
            e.printStackTrace();
        }
    }
}
