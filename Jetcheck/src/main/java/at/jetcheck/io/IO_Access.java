/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.jetcheck.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Matio Tawdrous
 */
public class IO_Access {
    public List<String> getFruehaufgaben(String path) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
        List<String> aufgaben = br.lines().collect(Collectors.toList());
        return aufgaben;
    }
    public List<String> getZwischenaufgaben(String path) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
        List<String> aufgaben = br.lines().collect(Collectors.toList());
        return aufgaben;
    }
    public List<String> getSpaetaufgaben(String path) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
        List<String> aufgaben = br.lines().collect(Collectors.toList());
        return aufgaben;
    }
    public List<String> editFruehaufgaben(List<String> fruehaufgaben_new, String path) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(path)))) {
            for (int i = 0; i < fruehaufgaben_new.size(); i++) {
                bw.write(fruehaufgaben_new.get(i));
            }
            bw.close();
        }
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        fruehaufgaben_new = br.lines().collect(Collectors.toList());
        br.close();
        return fruehaufgaben_new;
    }
    public List<String> editZwischenaufgaben(List<String> zwischenaufgaben_new, String path) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(path)))) {
            for (int i = 0; i < zwischenaufgaben_new.size(); i++) {
                bw.write(zwischenaufgaben_new.get(i));
            }
            bw.close();
        }
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        zwischenaufgaben_new = br.lines().collect(Collectors.toList());
        br.close();
        return zwischenaufgaben_new;
    }
    public List<String> editSpaetaufgaben(List<String> spaetaufgaben_new, String path) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(new File(path)))) {
            for (int i = 0; i < spaetaufgaben_new.size(); i++) {
                bw.write(spaetaufgaben_new.get(i));
            }
            bw.close();
        }
        BufferedReader br = new BufferedReader(new FileReader(new File(path)));
        spaetaufgaben_new = br.lines().collect(Collectors.toList());
        br.close();
        return spaetaufgaben_new;
    }
}